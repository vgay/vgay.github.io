\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"Sister Cheryl"
composer = #"Tony Williams"
meter = #"(Calypso)"
kwtempo = #"Medium"
kwstyle = #"Calypso"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Tony Williams" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=prS-6_nZtZA"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
}


form = \markup  \fill-line {
  \column {  }
  \column { \line \fontsize #2 { "(chords in brackets are played during solos)" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  b1*2:7sus4 b:6.9
  b1:6.9 gis:m7 a:6.9 s a:6.9 fis:m7 b:6.9 s b:7sus4 b:6.9
  g:7+/b b:5+7 d2/e c/e bes/c c:6
  a1:7sus4 b:9+/a a:7sus4 cis:m7
  c:7+ d:7 e:7sus4 c:5-7+/e
  b:7sus4 b:6.9 b:7sus4 s
  d:7 e:m e:m7+/dis e:m7/d e:m6/cis
  c:7+ d:7 e:7sus4 e
}

harmoniesII = \chordmode {
  \set chordChanges = ##f
  %\override ChordNames.ChordName.color = #grey
  s1*15
  \startParenthesis \parenthesize b1:5+9+ e:m7 \endParenthesis \parenthesize  c:7sus4
}


theNotes =  \relative c' {
  \clef "treble" \key e \major \time 4/4
  \mark \markup \box Intro
  % \partial 8
  \override TextSpanner.bound-details.left.text = \markup \pad-around #1 "bars not played during solos"
  \textSpannerDown \showStartRepeatBar \bar "[|:"
  \repeat volta 2 { R1 _\markup "Piano fill" R1*3 } \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup {  \box A \raise #1 \with-color #red \musicglyph "scripts.varsegno" }
  \repeat volta 2 {
    \tuplet 3/2 { fis4 e dis } dis2~ | 2 \tuplet 3/2 { fis4 b dis }
    cis2 \glissando a~ | a2. r4 \break
    \tuplet 3/2 { cis4 b a } a2~ | 2 \tuplet 3/2 { e'4 dis cis }
    b8 dis4.~ 2 \glissando | b1 | R \startTextSpan | R \stopTextSpan
  }
  \break \mark #2
  <<
    { \tuplet 3/2 { d4 cis b } b2~ |

      2 r8 b dis! g |
      <d fis>2 <c e> | <bes d> <a c> \break
      <g b~>2 \tuplet 3/2 { b4 a g } | <dis fis~ >2 \tuplet 3/2 { fis4 g a }
      <g b~>2 \tuplet 3/2 { b4 a g } | <cis, fis>1 \break \mark #3 \bar "||"
      r8 b'4-> a8~-> a g4.-> | \toCoda fis4-. e2-> d8 e->~ | 1~ 1 \break
    } \\
    { r2 \tuplet 3/2 { g4 fis e } | dis!2 r8 b dis g | a2 g f e
      d1 b d b
      r8 <e g>4 <d fis>8~ q <c e>4. | <a d>4-. q2 <fis c>8 q~ | 1~ 1
    }
  >> R R R R \break \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \with-color #red "after solos D.S. al Coda"
  \markup \with-color #red \musicglyph "scripts.varcoda"
  <<
    { fis'4-. e2-> d8 e-> \override Rest #'staff-position = #0
      \repeat volta 2 { \comp #16 } \break
      r8 b'-> r a-> r g4.-> | fis4-. e2-> d8 e->~ | 1~ \fermata 1 \fermata
    } \\
    { <a, d>4-. q2 f8 e'~ | e1 dis d cis
      r8 <e g>8 r <d fis> r <c e>4. | <a d>4-. q2 <fis c>8 q~ | 1~ 1
    }
  >>
  \bar ".."
  \label #'theLastPage
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c {
  \clef "bass" \key e \major \time 4/4

  \showStartRepeatBar \bar "[|:"
  \repeat unfold 2 { b4. fis'8  b2 | b,4. fis'8 \scoop cis'4 b }

  %\bar ".."
}

BasseII = \relative c {
  \clef "bass" \key e \major \time 4/4
  \mark \markup \box Intro
  \override TextSpanner.bound-details.left.text = \markup \pad-around #1 "bars not played during solos"
  \textSpannerDown \showStartRepeatBar \bar "[|:"
  \repeat volta 2 { \repeat unfold 2 { b4. fis'8  b2 | b,4. fis'8 \scoop cis'4 b } }
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup {  \box A \raise #1 \with-color #red \musicglyph "scripts.varsegno" }
\break \repeat volta 2 {
 b,4. fis'8 \scoop cis'4 b |  gis,4. dis'8 \scoop b'4 dis,
 a4. e'8 \scoop b'4 a | a,4. e'8 \scoop b'4 a8 a |  \break
 a,4. e'8 \scoop b'4 a | fis,4. cis'8 a'4 cis, |
 b4. fis'8 \scoop cis'4 b | b,4. fis'8 \scoop cis'4 b8 b
 b,4. \startTextSpan fis'8 \scoop cis'4 b | b,4 \scoop cis' b fis \stopTextSpan
} \break \mark #2
b,4. g'8 b4 g | b,4. dis8 b'4 dis, | r8 e,4.-> r8 e4.-> | r8 c'4.-> r8 c4.-> \break
a4. e'8 b'4 a | a,4. dis8 b'4 dis, |
a4. e'8 b'4 a | cis,4. gis'8 \scoop dis'4 cis \break \mark #3
c,4. g'8 \scoop d'4 c | \toCoda d,4. a'8 \scoop e'4 d |
e,4. b'8 cis4 b | e, b' c b \break
b,4. fis'8 bis4. fis8 | b,4. fis'8 \scoop cis'4 b |
b,4. fis'8 bis4. fis8 | b,4 \scoop cis' b bis
\break \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \with-color #red "after solos D.S. al Coda"
  \markup \with-color #red \musicglyph "scripts.varcoda"
  d,4. a'8 \scoop e'4 d8 e,~
  \repeat volta 2 {
  e4. b'8 cis4 b |  dis,4. b'8 cis4 b |  d,4. b'8 cis4 b |  cis,4. b'8 cis4 b |
  } \break
  r8 c,-> r c-> r c4.-> | d4-. 2-> 8 e->~ | 1\fermata e,\fermata

  \label #'theLastPage
  \bar ".."
}

up = \drummode {
  \repeat percent 4 { \repeat unfold 2 { cymr8 16 <tomml cymr>16 q8 cymr16 16 }  }
}
down = \drummode {
  \repeat unfold 2 { bd8 hhp r <hhp bd> }
}

grille = \chordmode {
  \bar "[|:" \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup Intro
  \repeat percent 2 { b1:7sus4 } \repeat percent 2 { b:6.9 }
  \break \mark #1 \bar ":|][|:"
  b:6.9 gis:m7 \repeat percent 2 { a:6.9 } \break
  a:6.9 fis:m7 \repeat percent 2 { b:6.9 } \break \mark #2 \bar ":|]"
  g:7+/b b:5+7.9+ e:m7 c:7sus4 \break
  a:7sus4 b:9+/a a:7sus4 cis:m7 \break \mark #3 \bar "||"
  c:7+ d:7 e:7sus4 c:5-7+/e \break
  b:7sus4 b:6.9 \repeat percent 2 { b:7sus4 }

  \bar ".." }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames \with { \override  ChordName.font-size = #-1 } { \harmoniesII }
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \Basse
      >> >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "BassTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames \with { \override  ChordName.font-size = #-1 } { \harmoniesII }
        \new ChordNames { \harmonies }
        \new StaffGroup <<
           \new Staff { \key e \major R1 _\markup "Piano fill" \repeat unfold 3 { R1 } }
         \new Staff \with { instrumentName = \CleFa } \BasseII
          \new DrumStaff <<
            \new DrumVoice { \voiceOne \up }
            \new DrumVoice { \voiceTwo \down }
          >>
      >> >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
   \score {
      <<
        \new ChordNames \with { \override  ChordName.font-size = #-1 } { \transpose c d \harmoniesII }
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new Staff \Basse
      >> >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
   \score {
      <<
        \new ChordNames \with { \override  ChordName.font-size = #-1 } { \transpose c a \harmoniesII }
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
          \new Staff \Basse
      >> >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames \with { \override  ChordName.font-size = #-1 } { \harmoniesII }
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \Basse
          \new DrumStaff <<
            \new DrumVoice { \voiceOne \up }
            \new DrumVoice { \voiceTwo \down }
          >>
      >> >>
    } \form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames \with { \override  ChordName.font-size = #-1 } { \harmoniesII }
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff { \key e \major R1 _\markup "Piano fill" \repeat unfold 3 { R1 } }
          \new Staff \with { instrumentName = \CleFa } \BasseII
          \new DrumStaff <<
            \new DrumVoice { \voiceOne \up }
            \new DrumVoice { \voiceTwo \down }
          >>
      >> >>
    } \form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Bba4")
  \bookpart {
   \score {
      <<
        \new ChordNames \with { \override  ChordName.font-size = #-1 } { \transpose c d \harmoniesII }
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new Staff \Basse
          \new DrumStaff <<
            \new DrumVoice { \voiceOne \up }
            \new DrumVoice { \voiceTwo \down }
          >>
      >> >>
    } \form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Eba4")
  \bookpart {
   \score {
      <<
        \new ChordNames \with { \override  ChordName.font-size = #-1 } { \transpose c a \harmoniesII }
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
          \new Staff \Basse
          \new DrumStaff <<
            \new DrumVoice { \voiceOne \up }
            \new DrumVoice { \voiceTwo \down }
          >>
      >> >>
    } \form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

% \book {
%   \paper {
%     #(set-paper-size "tablette")
%     %page-count = #1
%   }
%   #(define output-suffix "BassTab")
%   %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa } <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
% } }
%
% \book {
%   \paper {
%     #(set-paper-size "a4")
%     %page-count = #1
%   }
%   #(define output-suffix "Bassa4")
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa }
%         <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \\grille
% } } }

% \book {
%   %\paper { %page-count = #1
%	#(set-paper-size "a4")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSa4")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \transpose c a \grille
% } } }

% \book {
%   %\paper { %page-count = #2
%	#(set-paper-size "tablette")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSTab")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
% } } }