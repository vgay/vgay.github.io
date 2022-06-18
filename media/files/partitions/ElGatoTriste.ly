\version "2.22.1"
#(set-global-staff-size 17)
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

title = #"El Gato Triste"
composer = #"Chuck Mangione"
meter = #"(Med. Latin)"
kwtempo = #"Medium"
kwstyle = #"Latin"

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
  %asplayed = #"Chuck Mangione" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=6wI0kwchdkM"
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
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  g1:m f:m g:m f2.:m d4:7sus4 g2:m f:m g1:m a2:m5-7 d:9- g1:m g:m
  c:m g:m c2:m7 f:7 bes1:7+ a2:m5-7 d:9- g1:m  a2:m5-7 d:9- g1:m
  g1:m f:m g:m f2.:m d4:7sus4 g2:m f:m g1:m a2:m5-7 d:9- g1:m
  g2:m g:m/f es:7+ d:7sus4 g:m g:m/f es:7+ d:7sus4 g1:m

}


theNotes =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  % \partial 8
  \showStartRepeatBar \bar "[|:" \mark #1
  \repeat volta 2 { r8 d g a bes a g d | c1 | r8 d g a bes a g d' | c as~ 4~ 8 d, g a | \break
                    bes a g d' es es, as es' | d2~ 8 d, g d' | c4. d,8  a'4 c |  }
  \alternative { { bes1 } { bes2. bes'8 g } } \break \bar "||" \mark #2
  es2~ 8 a4 es8 | d2~ 8 bes'4 g8 | es2 c'4 a | f4 es2 d4 | \break
  c2~ 8 d d' c | c4 bes a es | d2~ 8 c bes a | bes2. r4 \bar "||" \break \mark #1
  r8 d, g a bes a g d | c1 | r8 d g a bes a g d' | c as~ 4~ 8 d, g a | \break
  bes a g d' es es, as es' | d2~ 8 d, g d' | c4. d,8  a'4 c |
  \tweak self-alignment-X #RIGHT
  \mark \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  bes1 \break
  \mark \markup  { \with-color #red { \musicglyph "scripts.varcoda" } }
  bes1~ | 2~ 8 d, a' c | bes1~ | 2~ 8 d, a' c | bes1 \fermata
  \bar ".."
  \label #'theLastPage
}

theNotesEb =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  % \partial 8
  \showStartRepeatBar \bar "[|:" \mark #1
  \repeat volta 2 { r8 d g a bes a g d | c1 | r8 d g a bes a g d' | c as~ 4~ 8 d, g a | \break
                    bes a g d' es es, as es' | d2~ 8 d, g d' | c4. d,8  a'4 c |  }
  \alternative { { bes1 } { bes2. bes8 g } } \break \bar "||" \mark #2
  es2~ 8 a4 es8 | d2~ 8 bes'4 g8 | es2 c'4 a | f4 es2 d4 | \break
  c2~ 8 d d' c | c4 bes a es | d2~ 8 c bes a | bes2. r4 \bar "||" \break \mark #1
  r8 d g a bes a g d | c1 | r8 d g a bes a g d' | c as~ 4~ 8 d, g a | \break
  bes a g d' es es, as es' | d2~ 8 d, g d' | c4. d,8  a'4 c |
  \tweak self-alignment-X #RIGHT
  \mark \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  bes1 \break
  \mark \markup  { \with-color #red { \musicglyph "scripts.varcoda" } }
  bes1~ | 2~ 8 d, a' c | bes1~ | 2~ 8 d, a' c | bes1 \fermata
  \bar ".."
  \label #'theLastPage
}

Basse = \relative c {
  \clef "bass" \key bes \major \time 4/4
  % \partial 8
  \showStartRepeatBar \bar "[|:"
  g4 d'8 g r g, d' g | as, f' as c r bes4 as8 | g,4 d'8 g r g, d' g | as, f' as c r bes8  a8 d,
  g,4 d'8 g as, f' as c | g,4 d'8 g r d g d' | a4. es8 d r fis a |\repeat unfold 2 {  g,4 d'8 g r g, d' g } |
  c,4 g'8 c r c, g' c | g,4 d'8 g r g, d' g | c,4 g'8 c r f,, c' es | bes g' bes r f a bes4
  \repeat unfold 2 { a4. es8 d r fis a | g,4 d'8 g r g, d' g | }
  \repeat unfold 2 { g,4 d'8 g r g, d' g | as, f' as c r bes8 a d,8  }
  g,4 d'8 g as, f' as c | g,4 d'8 g r d g d' | a4. es8 d r fis a  g,4 d'8 g r g, d' g |
  g,4 d'8 g f2 | es4. g8 d r g a | g,4 d'8 g f2 | es4. g8 d r g a | g,1 \fermata
  %\bar ".."
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}
grille = \chordmode {
  \bar "[|:" \mark #1 g1:m f:m g:m f2.:m d4:7sus4 \break
  g2:m f:m g1:m a2:m5-7 d:9- g1:m \break \mark #2 \bar ":|]"
   c:m g:m c2:m7 f:7 bes1:7+ \break
   a2:m5-7 d:9- g1:m  a2:m5-7 d:9- g1:m \break \bar "||" \mark #1
g1:m f:m g:m f2.:m d4:7sus4 \break
g2:m f:m g1:m a2:m5-7 d:9-
\mark \markup  { \with-color #red { \musicglyph "scripts.varcoda" } }
g1:m \break
  \stopStaff s1 \bar "" s \bar "" s \startStaff
  \mark \markup \column { { \pad-around #2 " " } {\with-color #red { \musicglyph "scripts.varcoda" } } }
  g2:m d:m/f \break
  es:7+ d:7sus4 g2:m d:m/f es:7+ d:7sus4 g1:m

  \bar ".." }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \Basse
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotesEb
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \Basse
        >>
      >>
    } %\form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotesEb
        >>
      >>
    } %\form
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