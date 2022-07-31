\version "2.23.10"
#(set-global-staff-size 18)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "poly-mark-engraver223.ly"
\include "BookPartPagesJAS223.ly"
\include "MRB223.ly"
% \include "twoCompoundMetersJAS223.ly"
% \include "staffColor.ly"
%\include "Bass_changes_equal_root223.ly"
%\include "enHarmoniszeChordsName.ly"

title = #"Una Mas"
composer = #"Kenny Dorham"
meter = #"(Med. Latin)"
kwtempo = #"Medium"
kwstyle = #"Latin"
global = { \key des \major \time 4/4 }


\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 12)
                             (padding . 0))
}



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
%
% \layout {
%   \context {
%     \Score
%     dalSegnoTextFormatter = #(lambda (context return-count marks)
%                                #{ \markup { \with-color #red \fontsize #2 "D.C. al Coda"  } #})
%       }
% }


\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Kenny Dorham" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=TDETNk20Vkc"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \RhythmicStaff
    \override VerticalAxisGroup.staff-affinity = #DOWN
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
    #'((basic-distance . 0)
       (minimum-distance . 8.5 )
       (padding . 0)
       (stretchability . 0))
    \RemoveAllEmptyStaves
    \improvisationOn
    \override StaffSymbol.line-count = 0
    \remove Time_signature_engraver
    \remove Bar_engraver
  }
  \context {
    \ChordGridScore
    \override RehearsalMark.font-size = #'0.5
  }
}


message = \markup ""

Ossature = {
  \partial 8 s8
  \polyMark #'cu \markup { \box Intro }
  \repeat volta 2 { s1*4 } \break
  \polyMark #'cu \markup { \box Head \raise #1 \with-color #red \musicglyph "scripts.varsegno" }
  \repeat volta 2 {
    s1*4 \break
    s1*4 \break
    s1*4 \break \polyMark #'rue \markup { \box \with-color #red \concat { "To coda " \raise #1 \musicglyph "scripts.varcoda" } }
    s1*3
    \alternative {
      \volta 1 { \once \override Score.VoltaBracket.text = \markup \text \fontsize #4 "Head and solos" s1 }
      \volta 2 { \once \override Score.VoltaBracket.text = \markup \text \fontsize #4 "only before interlude"  s1 }
    }
    \break \bar "||"
    \polyMark #'lu \markup { \box Interlude (to play after last solo) }
  }
  \repeat volta 2 {
    s1*4 \break
    s1*4 \break
    s1*4 \break
    s1*3
  }
  \alternative {
    \volta 1 { s1 }
    \volta 2 { s }
  } \break \bar "|."
  \polyMark #'rde \markup \with-color #red "D.S. al Coda"
  \polyMark #'lu \markup \with-color #red \musicglyph "scripts.varcoda"
  s1*4
  \bar ".."
}

VoixI =  \relative c'' {
  \global
  \partial 8 r8
  \repeat unfold 4 { R1 }
  r4 as-. r8 8-> r4 | r4 g-. r8 8-> r4 |
  r4 as-. r8 8-> r g~ | g f g f g4 r |
  r4 des'-. r8 8-> r4 | r4 c-. r8 8-> r4 |
  r4 des-. r8 8-> r c-^ | r4 r8 bes  es des bes as |
  bes2 r8 as r des->~ | des2 r8 bes r f->~ | 2 r8 es r as-^  |  r4 r8 f as f es bes |
  des1 r4 r8 bes es des bes es, | as1 | R1 r2 r4 f'
  as2.~ 8 bes-> | R1 | r8 f as f as as r bes-> | r2 r4 bes |
  des2.~ 8 es-> | R1 | r8 bes8 des bes des des r ges-> | R1 |
  as,4 es'8 g, r es' r ges,| r es' r f,~ f4 r | ges4 des'8 f, r des' r e, | r des' r es,~ es4 r
  R1*3 r2. f4 R1
  des1 | r4 r8 bes es des bes f | as1~ as \fermata
}

VoixII =  \relative c'' {
  \global
  \partial 8 r8 \repeat unfold 4 { R1 }
  r4des-. r8 8-> r4 | r4 c-. r8 8-> r4 |
  r4 des-. r8 8-> r c~ | c bes c bes g4 r |
  r4 ges-. r8 8-> r4 | r4 f-. r8 8-> r4 |
  r4 ges-. r8 8-> r f-^ | r4 r8 bes  es des bes as |
  bes2 r8 as r des->~ | des2 r8 bes r f->~ | 2 r8 es r as-^  |  r4 r8 f' as f es bes |
  des1 r4 r8 bes es des bes es, | as1 | R1 r2 r4 bes
  as2.~ 8 d-> | R1 | r8 bes es <bes f'> <es as> q r <d bes'>-> | r2 r4 <f bes> |
  <as des>2.~ q8 <g es'>-> | R1 | r8 <f bes>8 <as des> <f bes> <as des> q r <g es'>-> | R1 |
  << { as4 es'8 g, r es' r ges,| r es' r f,~ f4 r | ges4 des'8 f, r des' r e, | r des' r es,~ es4 r }
     \\
     { as4. g8~ 4. ges8~ | 4. f8~ 4 r | ges4. f8~ 4. e8~ | 4. es8~ 4 r } >>
  R1*3 r2. <bes f>4 R1
  des1 | r4 r8 bes es des bes f | as1~ as \fermata
}
PianoRH =  \relative c' {
  \global
  \partial 8 r8
  \override TextSpanner.bound-details.left.text = "8ve 2nd X"
  \override TextSpanner #'extra-offset = #'( 0 . 1 )

  r4 <a es' as!>-> \startTextSpan r8 q-> r <as d g> | r4 q q-- q-- |
  r4 <a es' as!>-> r8 q-> r <as d g> | r4 <g d' ges>-> <as d g>2 \stopTextSpan
}
PianoLH =  \relative c {
  \clef "bass"
  \global
  \partial 8 c8
  f, c' es4_. f,8 es'4 d8 | r8 f, d' f, d'4 8 c |
  f, c' es4_. f,8 es'4 d8 | r4 cis4 d2
}

BassI =  \relative c, {
  \clef "bass"
  \global
  \partial 8 s8
  f2 _"Tacet 1st X" r4 a8 bes~ | 2 r4 8 f~ | 2 r4 a8 bes~ | 2 r4 8 f\laissezVibrer
}

Basse =  \relative c {
  \clef "bass"
  \global
  \partial 8 r8
  f2 _"Tacet 1st X" r4 a8 bes~ | 2 r4 8 f~ | 2 r4 a8 bes~ | 2 r4 8 f~
  f2  r4 a8 bes~ | 2 r4 8 f~ | 2 r4 a8 bes~ | 2 r4 bes
  bes2 r4 8 es,~ | 2 r4 a8 bes~ | 2 r4 8 es,-^ | R1
  as4. 8 2 | des4. 8 2 ges4. 8 4. b8-^  | R1
  r4 ges, es8 8 r8 es~ | 1 | r4 b4 f8 a r bes8~ | 1 | 1 \repeatTie
  f2  r4 a8 bes~ | 2 r4 8 f~ | 2 r4 a8 bes~ | 2 r4 bes
  bes2 r4 8 es,~ | 2 r4 a8 bes~ | 2 r4 8 es,-^ | R1
  as4 es'8 g, r es' r ges,| r es' r des~ 4 r | ges,4 des'8 f, r des' r b | r8 8 r8 8~ 4 r
  r4 ges' es8 8 r8 es~ | 1 | r4 b4 f8 a r bes8~ | 1  | 1 \repeatTie
  r4 ges' es8 8 r8 es~ | 1 | r4 c f8 b, r8 bes~ | 1 \fermata
}

accords = \chordmode {
  \set chordChanges = ##f s8
  f2..:9+ bes:13/d s4 f2:9+ s8 bes4.:13/d a2:7/cis bes:13
  f2..:5+9+ bes:13 s4 f2..:5+9+ bes:13 s4
  bes2..:5+9+ es:13 s4 bes2..:5+9+ es:13 s4
  as1:m7 des:7 ges:7+ b:7
  r4 ges4:6.9 e4.:7 es8 s1 r4 b:7 f4.:7 bes8 :m s1 bes:m
  f2..:9+ bes:13/d s4 f2:9+ s8 bes4.:13/d a2:7/cis bes:13
  f2..:5+9+ bes:13 s4 f2..:5+9+ bes:13 s4
  as4.:m as2:m7+ as:m7 des:7 s8 ges4. ges2:7+ b:7sus4 b:7 s8
  r4 ges4:6.9 e4.:7 es8 s1 r4 b:7 f4.:7 bes8:m s1 bes:m
  r4 ges4:6.9 e4.:7 es8 s1 r4 c:m5-7 f8:7 b4:7 bes:m11
}

grille = \chordmode {
  \bar "[|:"
  \polyMark #'lu \markup { \box Intro }
  \repeat volta 2 { \repeat unfold 2 { f1:5+9+ bes:13/d } } \break
  \polyMark #'lu \markup { \box Head \raise #1 \with-color #red \musicglyph "scripts.varsegno" }
  \repeat volta 2 {
    \repeat unfold 2 { f1:5+9+ bes:13/d } \break
    \repeat unfold 2 { bes:5+9+ es:13 } \break
    as:m7 des:7 ges:7+ b:7 \break
    \polyMark #'rue \markup { \with-color #red \concat { "To coda " \raise #1 \musicglyph "scripts.varcoda" } }
    %\override Score.NonMusicalPaperColumn.line-break-system-details = #'((extra-offset . (0 . -9 )))
    ges2:6.9 e:7 es1 b2:7 f:7 bes1:m \break }
  \polyMark #'lu \markup { \box Interlude (to play after last solo) }
  \repeat volta 2 {
    \repeat unfold 2 { f1:9+ bes:13/d } \break
    \repeat unfold 2 { bes:9+ es:13 } \break
    %\revert Score.NonMusicalPaperColumn.line-break-system-details
    as2:m as:m7+ as:m7 des:7 ges ges:7+ b:7sus b:7 \break
    %\override Score.NonMusicalPaperColumn.line-break-system-details = #'((extra-offset . (0 . -9 )))
    ges2:6.9 e:7 es1 b2:7 f:7 bes1:m \break }
  \polyMark #'rde \markup \with-color #red "D.S. al Coda"
  \polyMark #'lu \markup { \with-color #red \musicglyph "scripts.varcoda" }
  r4 ges:6.9 e2:7 es1 r4 c:m5-7 f:7 b:7 bes1:m11
  \bar ".." }

GridRhythm =
{ s1* 16 \repeat unfold 2 { r4 c4 4. 8~ 1 }
  s1*8 4. 8~ 4. 8~ 4. 8~ 2 4. 8~ 4. 8~ 4. 8~ 2
  \repeat unfold 2 { r4 c4 4. 8~ 1 }
  \repeat unfold 2 { r4 c4 4. 8~ 1 }
}

%CTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "CTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
      oddFooterMarkup = \markup \fill-line \fontsize #1  { "Lilypond sources embeded in this pdf file" }
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 #title }
        \fill-line \fontsize #3 { \concat { "Music from " #composer } }
        \vspace #2
        \fill-line  \fontsize #6 { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
        %\fill-line \fontsize #12 { \circle { \concat  {B \flat } }  }
        \vspace #1
        \fill-line \fontsize #4 { "Full Score" }
        %\fill-line \fontsize #4 { \concat { B \flat " version" } }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Trumpet } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Tenor Sax.  } }
        }
      }
    }
  }
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \VoixI
      >>
    } % \message
} }

%Ca4
\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
      oddFooterMarkup = \markup \fill-line \fontsize #1  { "Lilypond sources embeded in this pdf file" }
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 #title }
        \fill-line \fontsize #3 { \concat { "Music from " #composer } }
        \vspace #2
        \fill-line  \fontsize #6 { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
        %\fill-line \fontsize #12 { \circle { \concat  {B \flat } }  }
        \vspace #1
        \fill-line \fontsize #4 { "Full Score" }
        %\fill-line \fontsize #4 { \concat { B \flat " version" } }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Trumpet } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Tenor Sax.  } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Chords Grid  } }
        }
      }
    }
  }
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff  \with { instrumentName = Bass } \BassI
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
              \line { "Trumpet" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \VoixI
      >>
    }
  } \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff  \with { instrumentName = Bass } \BassI
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
              \line { "Tenor 8vb" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \VoixII
      >>
    }
  } \bookpart {
    \paperGrid
    \new ChordGridScore <<
      \new RhythmicStaff \with {
        \RemoveAllEmptyStaves
        \improvisationOn
        \override StaffSymbol.line-count = 0
        \remove Time_signature_engraver
        \remove Bar_engraver
      }
      \magnifyMusic 0.66 \GridRhythm
      \new ChordGrid \grille
    >>  \message
} }
%BbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
      oddFooterMarkup = \markup \fill-line \fontsize #1  { "Lilypond sources embeded in this pdf file" }
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 #title }
        \fill-line \fontsize #3 { \concat { "Music from " #composer } }
        \vspace #2
        \fill-line  \fontsize #6 { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
        %\fill-line \fontsize #12 { \circle { \concat  {B \flat } }  }
        \vspace #1
        \fill-line \fontsize #4 { "Full Score" }
        %\fill-line \fontsize #4 { \concat { B \flat " version" } }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Trumpet } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Tenor Sax.  } }
        }
      }
    }
  }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff  \with { instrumentName = Bass } \BassI
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
              \line { "Trumpet" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c d \VoixI
      >>
    } % \message
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff  \with { instrumentName = Bass } \BassI
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
              \line { "Tenor 8vb" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c d \VoixII
      >>
    } % \message
} }

%Bba4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    %print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
      oddFooterMarkup = \markup \fill-line \fontsize #1  { "Lilypond sources embeded in this pdf file" }
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 #title }
        \fill-line \fontsize #3 { \concat { "Music from " #composer } }
        \vspace #2
        \fill-line  \fontsize #6 { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
        %\fill-line \fontsize #12 { \circle { \concat  {B \flat } }  }
        \vspace #1
        \fill-line \fontsize #4 { "Full Score" }
        %\fill-line \fontsize #4 { \concat { B \flat " version" } }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Trumpet } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Tenor Sax.  } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Chords Grid  } }
        }
      }
    }
  }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff  \with { instrumentName = Bass } \BassI
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
              \line { "trumpet" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c d \VoixI
      >>
    }
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff  \with { instrumentName = Bass } \BassI
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
              \line { "Tenor 8vb" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c d \VoixII
      >>
    } % \message
  } \bookpart {
    \paperGrid
    \new ChordGridScore <<
      \new RhythmicStaff \with {
        \RemoveAllEmptyStaves
        \improvisationOn
        \override StaffSymbol.line-count = 0
        \remove Time_signature_engraver
        \remove Bar_engraver
      }
      \magnifyMusic 0.66 \GridRhythm
      \new ChordGrid \transpose c d \grille
    >>  \message
} }

%EbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
      oddFooterMarkup = \markup \fill-line \fontsize #1  { "Lilypond sources embeded in this pdf file" }
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 #title }
        \fill-line \fontsize #3 { \concat { "Music from " #composer } }
        \vspace #2
        \fill-line  \fontsize #6 { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
        %\fill-line \fontsize #12 { \circle { \concat  {B \flat } }  }
        \vspace #1
        \fill-line \fontsize #4 { "Full Score" }
        %\fill-line \fontsize #4 { \concat { B \flat " version" } }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Trumpet } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Tenor Sax.  } }
        }
      }
    }
  }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff  \with { instrumentName = Bass } \BassI
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
              \line { "Trumpet" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c a \VoixI
      >>
    } % \message
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff  \with { instrumentName = Bass } \BassI
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
              \line { "Tenor 8vb" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c a, \VoixII
      >>
    } % \message} }
} }

%Eba4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    %print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
      oddFooterMarkup = \markup \fill-line \fontsize #1  { "Lilypond sources embeded in this pdf file" }
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 #title }
        \fill-line \fontsize #3 { \concat { "Music from " #composer } }
        \vspace #2
        \fill-line  \fontsize #6 { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
        %\fill-line \fontsize #12 { \circle { \concat  {B \flat } }  }
        \vspace #1
        \fill-line \fontsize #4 { "Full Score" }
        %\fill-line \fontsize #4 { \concat { B \flat " version" } }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Trumpet } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Tenor Sax.  } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Chords Grid  } }
        }
      }
    }
  }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff  \with { instrumentName = Bass } \BassI
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
              \line { "Trumpet" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c a \VoixI
      >>
    }
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff  \with { instrumentName = Bass } \BassI
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
              \line { "Tenor 8vb" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c a, \VoixII
      >>
    } % \message
  } \bookpart {
    \paperGrid
    \new ChordGridScore <<
      \new RhythmicStaff \with {
        \RemoveAllEmptyStaves
        \improvisationOn
        \override StaffSymbol.line-count = 0
        \remove Time_signature_engraver
        \remove Bar_engraver
      }
      \magnifyMusic 0.66 \GridRhythm
      \new ChordGrid \transpose c a \grille
    >>  \message
} }

%BassTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "BassTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff \with {
            instrumentName = \markup {
              \center-column {
                \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.F_change" " "}
                \line { "Bass" }
          } } }
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          { \clef "bass" \Basse }
      >> >>
    } % \message
} }

%Bassa4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    %print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##f
    print-page-total = ##t
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new PianoStaff \with { instrumentName = Piano } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff \with {
            instrumentName = \markup {
              \center-column {
                \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.F_change" " "}
                %\line { "" }
          } } }
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          { \clef "bass" \Basse }
      >> >>
    }
  } \bookpart {
    \paperGrid
    \new ChordGridScore <<
      \new RhythmicStaff \with {
        \RemoveAllEmptyStaves
        \improvisationOn
        \override StaffSymbol.line-count = 0
        \remove Time_signature_engraver
        \remove Bar_engraver
      }
      \magnifyMusic 0.66 \GridRhythm
      \new ChordGrid \grille
    >>  \message
} }
