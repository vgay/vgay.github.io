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
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 16)
                             (minimum-distance . 12)
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

title = #"Still There"
composer = #"Mike Stern"
meter = #"(6/8 Ballad)"
kwtempo = #"Slow"
kwstyle = #"Ballad"

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
  asplayed = #"Mike Stern" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=3HYZU1AmEcY"
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


voltaAdLib = \markup {\small \text "ad lib." }
voltaOnCue = \markup \small \text "On Cue"

harmonies = \chordmode {
  \set chordChanges = ##f
c2.:m7 as:7+11+ g:m7 s c2.:m7 as:7+11+ g:m7 f:m7
e:m7 b:m7 c:7+ b4.:m7 bes a:m7 as g2.
c2.:m7 as:7+11+ g:m7 bes:7sus4 c:m7 s4. es8 bes/d es f4.:m es bes/d es8 bes/d es
as4. bes c:m es8 bes/d es  f4.:m es bes/d es as2. g:m7 ges:sus2 e:7+ s
c2.*2:m7 as:7+ g:7 c:m7 f2.:m7 s4. des c2.:m7 s f:m7 es des:7+ s4. es8 bes/d es
f4.:m es bes/d es8 bes/d es
as4. bes c:m es8 bes/d es  f4.:m es bes/d es as2. g:m7 ges:sus2 e:7+ s
as2. g4.:m7 es8 bes/d es f4.:m es bes/d es8 bes/d es
as4. bes c:m es8 bes/d es  f4.:m es bes/d es as2. g4.:m7 es8 bes/d es
as2. g:m7 ges:sus2 e:7+
}


theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 6/8
  \set Staff.printKeyCancellation = ##f
  \set Staff.explicitKeySignatureVisibility = #'#(#f #f #t)
   \showStartRepeatBar \bar "[|:"
\repeat volta 2 {
r8 g d' es4. | r8 f, d' es8. d16 c8 | bes4 d,8 bes'4. | R2.
r8 g d' es4. | r8 f, es' d4 \tuplet 3/2 { c16 des c } | bes4 d,?8 bes'4. | bes as
} \break
\key g \major r8 b fis' g8. fis16 e8 | d4 f,8 d'4. | r8 b a' g8. fis16 e8 |
d4 fis,8 d'4 es16 d | c4 e,?8 c'4. | c b \bar "||" \break
\key es \major r8 g d' es4. | r8 f, es'8 d4 c8 | bes4 d,8 bes'4. | bes4 d,8 bes'4 as8
g2.~ | 4. g'8 f g | as4. g | f  g8 f g | \break
c,4. es | r4. g8 f bes | as4. g4 f16 es | f4. g4 \tuplet 3/2 { fis16 f es }
\tweak self-alignment-X #RIGHT
\mark \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
c2 r8 d | d16 c bes8~ 2 | bes4. as | es'2. R \break
\once \override Score.RehearsalMark #'self-alignment-X = #LEFT
\mark \markup \box Solos
\override Stem #'transparent = ##t
\withMusicProperty untransposable ##t {
\improvisationOn \repeat volta 2 { \repeat unfold 16 { bes4. }  } \break
\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
\mark \markup 3X
 \repeat unfold 15 { bes4. }
\improvisationOff }
\revert Stem #'transparent g'8 f g \bar "||" \break
as4. g | f  g8 f g | c,4. es | r4. g8 f bes |
as4. g4 f16 es | f4. g4 \tuplet 3/2 { fis16 f es } | \break
c2 r8 d | d16 c bes8~ 2 | bes4. as | es'2. R \break
%\mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
\doubleMark
\markup \with-color #red { "D.C. al Coda" \raise #1 \musicglyph "scripts.varcoda"}
\markup \column { \pad-around #3 " " \with-color #red  \musicglyph "scripts.varcoda" }
c2 r4 |  g4. g'8 f g |


\repeat volta 2 {
as4. _\markup \column { "Saxo Solo over melody from 2nd X to cue" " " } g | f  g8 f g | c,4. es | r4. g8 f bes | \break
as4. g4 f16 es | f4. g4 \tuplet 3/2 { fis16 f es } }
\alternative {
  {\overrideProperty Score.VoltaBracket.text \voltaAdLib  c2 r4 |  g4. g'8 f g }
  { \overrideProperty Score.VoltaBracket.text \voltaOnCue c,2 r8 d } }
 d16 c bes8~ 2 | bes4. as | es'2.~ | 2.
  \bar ".."
   \label #'theLastPage
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c' {
  \clef "bass" \key f \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"

  \bar ".."
}

grille = \chordmode {
  \bar "[|:"

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
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
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
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
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
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a, \theNotes
        >>
      >>
} } }

